import unicodedata
import re
import json
import nltk
from nltk.tokenize.toktok import ToktokTokenizer
from nltk.corpus import stopwords
import pandas as pd


def get_ASCII(article):
    '''
    normalizes a string into ASCII characters
    '''

    article = unicodedata.normalize('NFKD', article)\
    .encode('ascii', 'ignore')\
    .decode('utf-8', 'ignore')
    
    return article


def purge_non_characters(article):
    '''
    removes special characters from a string
    '''
    
    article = re.sub(r"[^a-z\s]", ' ', article)
    
    return article

def stem(article):
    '''
    stems words in a string
    '''

    # create stem object
    ps = nltk.porter.PorterStemmer()
    
    # split article into list of words and stem each word
    stems = [ps.stem(word) for word in article.split()]

    #  join words in list into a string
    article_stemmed = ' '.join(stems)

    return article_stemmed


def lemmatize(article):
    '''
    lemmatizes words in a string
    '''

    # create lemmatize object
    wnl = nltk.stem.WordNetLemmatizer()
    
    # split article into list of words and stem each word
    lemmas = [wnl.lemmatize(word) for word in article.split()]

    #  join words in list into a string
    article_lemmatized = ' '.join(lemmas)
    
    return article_lemmatized


def remove_stopwords(article,extra_words=[],exclude_words=[]):
    '''
    removes stopwords from a string
    user may specify a list of words to add or remove from the list of stopwords
    '''

    # create stopword list using english
    stopword_list = stopwords.words('english') + ["a", "aa","aaa","aaaa","aaaaa","aaaaaa"]
    
    # remove words in extra_words from stopword list 
    [stopword_list.remove(f'{word}') for word in extra_words]
    
    # add words fin exclude_words to stopword list
    [stopword_list.append(f'{word}') for word in exclude_words]
    
    # slpit article into list of words
    words = article.split()

    # remove words in stopwords from  list of words
    filtered_words = [w for w in words if w not in stopword_list]
    
    # rejoin list of words into article
    article_without_stopwords = ' '.join(filtered_words)
    
    return article_without_stopwords

def basic_clean(article):
    '''
    calls child functions preforms basic cleaning on a string
    converts string to lowercase, ASCII characters,
    and eliminates special characters
    '''
    # lowercases letters
    article = article.lower()

    # convert to ASCII characters
    article = get_ASCII(article)

    # remove non characters
    article = purge_non_characters(article)
    
    return article

def prep_readme():
    '''
    takes in a dataframe with a 'readme_contents' column and adds columns 
    tokinizing the readme columns using stem and lemmatize
    '''

    # open jason files
    with open('data.json', 'r') as f:
        datastore = json.load(f)
    
    # convert data to dataframe
    df = pd.DataFrame(datastore)
    df = df[df.language!='Jupyter Notebook']
    df = df[df.readme_contents!="error no readme"]
   # create column applying basic_cleaning and stem functions
    df['readme_contents_stemmed'] = df.readme_contents.apply(basic_clean).apply(remove_stopwords).apply(stem)

    # create column applying basic_cleaning and lemmatize functions
    df['readme_contents_lemmatized'] = df.readme_contents.apply(basic_clean).apply(remove_stopwords).apply(lemmatize)

    # drop null values
    df = df.dropna()
    return df

def tokenize(article):
    '''
    tokenizes words in a string
    '''

    # create token object
    tokenizer = nltk.tokenize.ToktokTokenizer()

    # use object to tokenize string
    article = tokenizer.tokenize(article, return_str=False)
    
    return article