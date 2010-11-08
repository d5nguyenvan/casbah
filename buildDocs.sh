#!/bin/sh

rm -rf docs
mkdir -p docs/casbah-commons
mkdir -p docs/casbah-core
mkdir -p docs/casbah-gridfs
mkdir -p docs/casbah-query

sbt "update" "clean" "doc"

cp -R casbah-commons/target/scala_2.8.0/classes.sxr docs/casbah-commons/sxr
cp -R casbah-commons/target/scala_2.8.0/doc/main/api docs/casbah-commons/api
cp -R casbah-core/target/scala_2.8.0/classes.sxr docs/casbah-core/sxr
cp -R casbah-core/target/scala_2.8.0/doc/main/api docs/casbah-core/api
cp -R casbah-gridfs/target/scala_2.8.0/classes.sxr docs/casbah-gridfs/sxr
cp -R casbah-gridfs/target/scala_2.8.0/doc/main/api docs/casbah-gridfs/api
cp -R casbah-query/target/scala_2.8.0/classes.sxr docs/casbah-query/sxr
cp -R casbah-query/target/scala_2.8.0/doc/main/api docs/casbah-query/api

cp doc_index.html docs/index.html

cd docs
perl -p -i -e 's#http://api.mongodb.org/scala/casbah/source.sxr/.*(casbah-.*)/src/main/scala#http://api.mongodb.org/scala/casbah/\1/sxr#gi' `find ./ -name \*.html`

