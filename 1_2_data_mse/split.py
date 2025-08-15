def gen_head(title,permalink='/data_mse/'):
    head=f"""---
layout: page
title: {title}
permalink:
---"""
    return head
if __name__=='__main__':
    with open('weekly_read.md','r') as fo:
        cnt=fo.read()

    blocks=cnt.split('# Week')

    lecture_info=blocks[0]
    #Create 'dat_mse.md'
    head=gen_head(title='data MSE',permalink='/data_mse/')
    with open('tmp/data_mse.md','w') as fo:
        fo.write(head)
        fo.write('\n')
        fo.write(lecture_info)
        fo.write('\n')

        ## create 15 links
        for iweek in range(15):
            template="[Week %2.2i]({%% link lecturenotes/data_mse/weekly_read_week_%2.2i.md %%})"%(iweek+1,iweek+1)
            fo.write(template)
            fo.write('\n\n')

    blocks=blocks[1:]
    print(f'weeks: {len(blocks)}')
    # print(blocks[1])
    for iweek, bl in enumerate(blocks):
        fn='tmp/weekly_read_week_%2.2i.md'%(iweek+1)
        with open(fn,'w') as fo:
            head=gen_head(title='DATA MSE week %2.2i'%(iweek+1),permalink='')
            fo.write(head)
            fo.write('\n')
            fo.write('<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>')
            fo.write('\n')
            fo.write(bl)

    ## copy to ~/repo/youngung.github.io/lecturenotes/data_mse/
