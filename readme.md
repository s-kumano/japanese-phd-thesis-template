主に英語，たまに日本語を使うような博士論文のLaTeXテンプレート．

対応コンパイラ:

- （推奨）LuaLaTeX
- XeLaTeX
- pdfLaTeX

以下のLaTeXテンプレートにインスパイアされています．

https://github.com/kks32/phd-thesis-template/

# 仕様

カッコ内はクラスファイルの該当箇所を指す．

- （17行目）フォントサイズや用紙サイズを一般的なものに．
- （`Size`セクション）余白を一般的なものに．
- （`Font`セクション）英語はTimes系．日本語はLuaLaTeXとXeLaTeXでNoto Serif CJK JP（源ノ明朝），pdfLaTeXでIPAex明朝．
- （`Title`セクション）表紙レイアウトの自動調節．
- （`Acknowledgements / Abstract`セクション）両面印刷対応を含む，一般的な環境の提供．
- （`ToC / LoF / LoT`セクション）目次・図表リストにて以下の変更．
    - 目次に「目次」を含まない．
    - 目次デフォルト名を`Contents`から`Table of Contents`に．
    - `\hypersetup{colorlinks}`使用時でもリンク色を黒のままに．
    - `References`を目次に含むように．
- （`References`セクション）BibTeXまたはBibLaTeXにおいて，チャプター名を`Bibliography`から`References`に．
- （`Appendix`セクション）Appendixにおける図・表・式番号をチャプターの先頭アルファベットでリネーミング (e.g., Figure A.1). また両面印刷対応．

**推奨コンパイラ**

推奨コンパイラはLuaLaTeXです．XeLaTeXとpdfLaTeXでも動作しますが，日本語の文字間で半角スペースが効かず，全角スペースを用いる必要があります．

**表紙レイアウトの変更**

レイアウトを変更したい場合はクラスファイルの`Title`セクションを変更してください．特にスペースに関しては`[0.1em]`や`\vspace`によって記述されている部分を変更してください．
