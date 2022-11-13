from args import get_args
from crawler import Crawler
from datetime import datetime
from lxml import etree
import requests

if __name__ == '__main__':
    args = get_args()
    crawler = Crawler()
    contents = crawler.crawl(args.start_date, args.end_date)
    contents.sort(key=lambda c : datetime.strptime(c[0],'%Y-%m-%d').date(), reverse=True)
    # TODO: write content to file according to spec
    with open(f"{args.output}", "w") as fp:
        fp.write('"Post Date",Title,Content')
        for content in contents:
            fp.write("\n" + content[0] + ',' + content[1] + ',' + content[2])