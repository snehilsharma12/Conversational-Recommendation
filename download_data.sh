mkdir data/dialogue
mkdir data/dialogue/music
mkdir data/dialogue/movies
mkdir data/dialogue/books
mkdir data/dialogue/redial

cd data/dialogue

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1naj_8j0MeCH2ZZ8u8WKLJqKDEoc5kggN' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1naj_8j0MeCH2ZZ8u8WKLJqKDEoc5kggN" -O dialogues.csv.zip && rm -rf /tmp/cookies.txt
unzip dialogues.csv.zip
rm dialogues.csv.zip

git clone https://github.com/ReDialData/website.git
cd website
git checkout data