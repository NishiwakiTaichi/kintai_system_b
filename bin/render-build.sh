#!/usr/bin/env bash
# エラーが出たら即座に停止する
set -o errexit

# gemをインストール
bundle install

# アセット（CSS・JSなど）をビルド
bundle exec rails assets:precompile
bundle exec rails assets:clean

# データベースのマイグレーションを実行
bundle exec rails db:migrate
