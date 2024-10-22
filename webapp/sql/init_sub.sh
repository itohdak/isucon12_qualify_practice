#!/bin/sh

set -ex
cd `dirname $0`

# SQLiteのデータベースを初期化
rm -f ../tenant_db/*.db
cp -r ../../initial_data/*.db ../tenant_db/

for file in `ls -1 ../tenant_db/*.db`; do
	sqlite3 $file < ./tenant/20_patch.sql
done
