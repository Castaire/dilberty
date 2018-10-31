from bs4 import BeautifulSoup
import requests
import datetime

# variables
main_link = "http://dilbert.com/strip/"
main_class = "comic-item-container"
main_attr = "data-image"

# get site content
curr_date = datetime.datetime.now()
curr_date = curr_date.strftime("%Y-%m-%d")
page_link = main_link + curr_date

r = requests.get(main_link, timeout=10)
r.raise_for_status()

# parse content
content = BeautifulSoup(r.content, "html.parser")
content.decode()

image_container = content.find("div", class_=main_class)
image_url = image_container[main_attr]

# save comic
filename = curr_date+"_p.bmp"
filepath = "images\\"+filename
f = open(filepath, 'wb')
f.write(requests.get(image_url).content)
f.close

# output filepath
print(filepath)



