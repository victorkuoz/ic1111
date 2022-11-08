from crawler import Crawler
from args import get_args
from lxml import etree
import requests

if __name__ == '__main__':
    args = get_args()
    crawler = Crawler()
    contents = crawler.crawl(args.start_date, args.end_date)
    # TODO: write content to file according to spec
    with open(f"{args.output}", "w") as fp:
        fp.write('"Post Date",Title,Content')
        for content in contents:
            fp.write("\n" + content)