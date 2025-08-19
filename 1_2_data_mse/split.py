"""
This python script is to generate several markdown files from 'weekly_read.md'
to generate several 15 week-based markdown files along with its general
information file.
"""
import sys

def change_link(link='data/dualphase_sem.png',prefix='/lecturenotes/data_mse/'):
    return f'{prefix}{link}'

def gen_head(title,permalink='/data_mse/'):
    head=f"""---
layout: page
title: {title}
permalink: {permalink}
---"""
    return head
if __name__=='__main__':
    with open('weekly_read.md','r') as fo:
        cnt=fo.read()

    blocks=cnt.split('# Week')
    lecture_info=blocks[0]
    blocks=blocks[1:]

    title='data_mse'

    # Create 'dat_mse.md'
    head=gen_head(title=f'{title}',permalink='')
    with open(f'tmp/{title}.md','w') as fo:
        fo.write(f'{head}\n')
        fo.write(f'{lecture_info}\n')

        ## create 15 links
        for iweek in range(15):
            template="[Week %2.2i]({%% link lecturenotes/%s/weekly_read_week_%2.2i.md %%})"%(iweek+1,title,iweek+1)
            fo.write(f'{template}\n\n')

    # Create weekly read files
    print(f'weeks: {len(blocks)}')
    for iweek, bl in enumerate(blocks):
        fn='tmp/weekly_read_week_%2.2i.md'%(iweek+1)

        ## find image links and change the links
        if True:
            print(f'week: {iweek+1}')
            lines=bl.split('\n')
            for iline, line in enumerate(lines):
                if '![' in line and ']' in line and '(' in line and ')' in line:
                    print(f'Warning* probably a link. Modify link: {line}')
                    link_ori=line.split('(')[-1].split(')')[0]
                    link_new=change_link(link=link_ori)
                    before=line.split('(')[0]
                    lines[iline] = f'{before}({link_new})'
            bl=''
            for iline, line in enumerate(lines):
                bl=f'{bl}{line}\n'

        with open(fn,'w') as fo:
            head=gen_head(title=f'{title} week %2.2i'%(iweek+1),permalink='')
            fo.write(f'{head}\n')
            ## add link to latex to allow rendering equations with using latex.
            fo.write('<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>')
            fo.write(f'\n# Week {bl}')
