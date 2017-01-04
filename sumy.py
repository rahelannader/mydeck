
import codecs
import sys
import sumy
from sumy.parsers.plaintext import PlaintextParser
from sumy.nlp.tokenizers import Tokenizer
from sumy.summarizers.lsa import LsaSummarizer
def sumy(var,far):
    reload(sys)  # Reload does the trick!
    sys.setdefaultencoding('UTF8')
    # Set standard output encoding to UTF-8.
    sys.stdout = codecs.getwriter('UTF-8')(sys.stdout)
    import re
    with open(var, 'r') as file:
        text = file.read().decode("utf-8-sig").encode("utf-8")
    print 
    print 'With split:'
    g=re.sub(" \d+","",text)
    h=re.sub("\xe2\x80\x99","",g)
    i=text
    j=re.sub("%","",i)
    #paragraph=list(re.split(r'r{0,}\n{16,}',j))
    paragraph=list(re.split('Table of Contents',j))
    ip=iter(paragraph)
    f=open(far,'w')
    for index,i in enumerate(paragraph,start=1):
        print index
        if len(i)>50:
            f.write('\n ')
            f.write(str(index))
            f.write('')
            parser=PlaintextParser(i,Tokenizer("english"))
            summarizer=LsaSummarizer()
            summy=summarizer(parser.document,(round(((len(i)/2)**0.1),0)))
            summay=re.sub("\n","",str(summy))
            sumay=re.sub("<Sentence:","\n",str(summay))
            summa=re.sub('[>,)]',"",str(sumay))
            ummay=re.sub('[)]',"",str(summa))
            summay=re.sub("[>)]","",str(ummay))
            summary=re.sub("[>,]","",str(summay))
            summary=re.sub("[)((]","",str(summay))
            f.write(str(summary))
#for sentence in summary: f.write((sentence))
return