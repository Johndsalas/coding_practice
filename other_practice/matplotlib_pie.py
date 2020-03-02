from matplotlib import pyplot as plt

# Language Popularity

plt.style.use('fivethirtyeight') # use graph style

slices = [59219, 55466, 47544, 36443, 35917]
labels = ['JavaScript', 'HTML/CSS', 'SQL', 'Python', 'Java', ]
explode = [0,0,0,0.1,0]

plt.pie(slices,labels=labels,explode=explode, shadow=True, 
        autopct='%1.1f%%',
        startangle=90, wedgeprops={'edgecolor':'black'})

plt.title('My Awsome Pie Chart')

plt.tight_layout() #gives padding for better look

plt.show()