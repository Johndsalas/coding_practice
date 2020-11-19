from requests import get
from bs4 import BeautifulSoup, SoupStrainer
from os import path
import os
import json
from typing import Dict, List
import requests
from env import github_token

def get_links():
    #input_urls = ["https://github.com/search?o=desc&q=python&s=stars&type=Repositories","https://github.com/search?l=HTML&o=desc&q=python&s=stars&type=Repositories", "https://github.com/search?l=JavaScript&o=desc&q=python&s=stars&type=Repositories", "https://github.com/search?l=C%2B%2B&o=desc&q=python&s=stars&type=Repositories", "https://github.com/search?l=Shell&o=desc&q=python&s=stars&type=Repositories", "https://github.com/search?l=C&o=desc&q=python&s=stars&type=Repositories", "https://github.com/search?l=CSS&o=desc&q=python&s=stars&type=Repositories", "https://github.com/search?l=Java&o=desc&q=python&s=stars&type=Repositories"]
    #input_urls = ["https://github.com/search?l=C%2B%2B&p=8&q=languages&type=Repositories", "https://github.com/search?l=C%2B%2B&p=9&q=languages&type=Repositories", "https://github.com/search?l=C%2B%2B&p=10&q=languages&type=Repositories", "https://github.com/search?l=C&p=8&q=languages&type=Repositories", "https://github.com/search?l=C&p=9&q=languages&type=Repositories", "https://github.com/search?l=C&p=10&q=languages&type=Repositories", "https://github.com/search?p=4&q=shell&type=Repositories", "https://github.com/search?p=5&q=shell&type=Repositories", "https://github.com/search?p=6&q=Java&type=Repositories", "https://github.com/search?p=7&q=Java&type=Repositories", "https://github.com/search?p=8&q=Java&type=Repositories"]
    input_urls = ["https://github.com/search?p=8&q=python&type=Repositories", "https://github.com/search?p=9&q=python&type=Repositories", "https://github.com/search?p=10&q=python&type=Repositories", "https://github.com/search?o=desc&p=8&q=c&s=stars&type=Repositories", "https://github.com/search?o=desc&p=9&q=c&s=stars&type=Repositories",'https://github.com/search?l=HTML&o=desc&p=6&q=c&s=stars&type=Repositories', 'https://github.com/search?l=HTML&o=desc&p=7&q=c&s=stars&type=Repositories', 'https://github.com/search?l=HTML&o=desc&p=8&q=c&s=stars&type=Repositories', 'https://github.com/search?l=HTML&o=desc&p=9&q=c&s=stars&type=Repositories']
    urls = []
    for n in input_urls:
        url = n
        headers = {'User-Agent': 'Technomancer'}
        response = get(url, headers=headers)
        soup = BeautifulSoup(response.text,"html.parser")
        repocards = soup.select("div", class_="repo-list-item")

        for card in repocards:
            if card.select_one("a.v-align-middle") != None:
                try:
                    a = card.select_one("a.v-align-middle")
                    urlz = a["href"]
                    print(urlz)
                    urls.append(urlz)
                except:
                    continue
            else:
                continue
    urls = list(set(urls))
    return urls
urls = get_links()
while len(urls) < 11:
    urls = get_links()
urls
len(urls)




repos = urls
headers = {
    "Authorization": f"token {github_token}",
    "User-Agent": "Symeonw",
}

if (
    headers["Authorization"] == "token "
    or headers["User-Agent"] == "N/A"
):
    raise Exception(
        "You need to follow the instructions marked TODO in this script before trying to use it"
    )


def github_api_request(url: str) -> requests.Response:
    try:
        return requests.get(url, headers=headers)
    except:
        print('')
    

def get_repo_language(repo: str) -> str:
    url = f"https://api.github.com/repos{repo}"
    return github_api_request(url).json().get("language", None)


def get_repo_contents(repo: str) -> List[Dict[str, str]]:
    url = f"https://api.github.com/repos{repo}/contents/"
    return github_api_request(url).json()


def get_readme_download_url(files: List[Dict[str, str]]) -> str:
    """
    Takes in a response from the github api that lists
    the files in a repo and returns the url that can be
    used to download the repo's README file.
    """
    print('[get_readme_download_url] files', files)
    for file in files:
        print('[get_readme_download_url] file', file)
        if file["name"].lower().startswith("readme"):
            return file["download_url"]


def process_repo(repo: str) -> Dict[str, str]:
    """
    Takes a repo name like "gocodeup/codeup-setup-script" and returns
    a dictionary with the language of the repo and the readme contents.
    """
    contents = get_repo_contents(repo)
    try:
        return {
            "repo": repo,
            "language": get_repo_language(repo),
            "readme_contents": requests.get(get_readme_download_url(contents)).text,
        }
    except:
        return {
        "repo": repo,
        "language": get_repo_language(repo),
        "readme_contents": "error: no README",
        }


def scrape_github_data():
    """
    Loop through all of the repos and process them. Saves the data in
    `data.json`.
    """
    data = [process_repo(repo) for repo in repos]
    json.dump(data, open("data3.json", "w"))


if __name__ == "__main__":
    scrape_github_data()