from datetime import datetime
from lxml import etree
import requests
import time

class Crawler(object):
    def __init__(self, base_url='https://www.csie.ntu.edu.tw/news/', rel_url='news.php?class=101'):
        self.base_url = base_url
        self.rel_url = rel_url

    def crawl(self, start_date, end_date):
        contents = []
        page_num = 0
        while True:
            content, last_date = self.crawl_page(start_date, end_date, page=f'&no={page_num}')
            if content:
                contents += content
            if last_date < start_date:
                break
            page_num += 10
        return contents

    def crawl_page(self, start_date, end_date, page=''):        
        # TODO: parse the response and get dates, titles and relative url with etree
        contents = []
        time.sleep(0.1)
        response = requests.get(self.base_url + self.rel_url + page)
        root = etree.HTML(response.content.decode('utf-8'))
        posts = root.xpath("/html/body/div[1]/div/div[2]/div/div/div[2]/div/table/tbody/tr")

        for post in posts:
            date = datetime.strptime(post.xpath("./td")[0].text, "%Y-%m-%d").date()
            pinned = datetime(2022, 5, 26).date() == date

            if not pinned:
                if date > end_date:
                    continue
                if date < start_date:
                    break

            content = [
                date.strftime('%Y-%m-%d'),
                self.crawl_title(post.xpath("./td[2]/a")[0].text),
                self.crawl_content(post.xpath("./td[2]/a")[0].get('href'))
            ]

            if not pinned or (start_date <= date and date <= end_date):
                contents.append(content)
        return contents, date
    
    def crawl_title(self, text):
        title = ''
        for segment in text.split('"'):
            title += '""' + segment
        return '"' + title[2:] + '"'

    def crawl_content(self, rel_url):
        response = requests.get(self.base_url + rel_url)    # print(f"status: {response.status_code}")
        root = etree.HTML(response.content.decode("utf-8"))
        return '"' + self.crawl_text(root.xpath("/html/body/div[1]/div/div[2]/div/div/div[2]/div/div[2]")[0]) + '"'
    
    def crawl_text(self, current):
        text = ''
        if etree._ElementUnicodeResult == type(current):
            if '\r\n' == current[0:2]:
                current = current[2:]
            for segment in current.split('"'):
                text += '""' + segment
            text = text[2:]
        else:
            if 'br' == current.tag:
                text = '\n'
            for node in current.xpath('./node()'):
                text += self.crawl_text(node)
            if 'p' == current.tag or 'tr' == current.tag or 'li' == current.tag or 'div' == current.tag:
                if text != '':
                    text = text + '\n'
        return text