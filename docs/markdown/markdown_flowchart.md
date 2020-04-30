# 使用 Markdown 绘制流程图

在 Markdown 中绘制流程图，可以使用 [Mermaid][1] 或 [flowchart.js][4]。前者语法简单，后者图形更规范。

## Mermaid

```
graph TD
    Start --> Stop
```

## flowchart.js

```
st=>start: Start
op=>operation: Your operation
cond=>condition: Yes or No?
e=>end

st->op->cond
cond(yes)->e
cond(no)->op
```

## REF

1. [Flowchart - Mermaid][1]
1. [有道云笔记 Markdown 指南][2]
1. [Draw Diagrams With Markdown][3] - Typora
1. [flowchart.js][4]

[1]: https://mermaid-js.github.io/mermaid/#/flowchart "Flowchart - Mermaid"
[2]: http://note.youdao.com/iyoudao/?p=2445 "有道云笔记 Markdown 指南"
[3]: https://support.typora.io/Draw-Diagrams-With-Markdown/ "Draw Diagrams With Markdown"
[4]: https://flowchart.js.org/ "flowchart.js"