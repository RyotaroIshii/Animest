class InvalidWordsValidator < ActiveModel::EachValidator

# record : テーブル名のこと(Micripostとか)
# attribute : カラム名（contentとか）
# value : フォームに入力された値（"おはよう","foobar"とか）
  def validate_each(record, attribute, value)
# blacklist.ymlから不適切な言葉を読み取る
    blacklist = YAML.load_file(__dir__+'/../../config/blacklist.yml')
# valueが空でないか、blacklistに入力された値が含まれているかを判断
    if value.present? && blacklist.any?{ |word| value.include?(word) }
# :contain_blacklist_wordsはja.ymlなどに定義しておくとよい。
      record.errors.add(attribute,'不適切な表現が含まれています')
    end

# same_character_regex: 連続する五文字以上の語（"あああああ"）などを防ぐ
# url_regex: https(http)から始まるurlを防ぐ
# html_regex: htmlタグを防ぐ

# 正規表現のエスケープのため %r!正規表現!で囲む

    invalid_regex = { same_character_regex: %r!(.)\1{4,}!,
                      url_regex: %r!https?://[\w/:%#\$&\?\(\)~\.=\+\-]+!,
                      html_regex: %r!<(".*?"|'.*?'|[^'"]|)*?>! }

# invalid_regexをinvalid_key,invalid_valueとして取り出しinvalid_value.match?(value)で正規表現と一致しているかを調べる。

    if value.present? && value.match?(invalid_regex[:same_character_regex])
      record.errors.add(attribute, '同じ文字が5文字以上続いています')
    end

    if value.present? && invalid_regex.any? { |key, regex| key != :same_character_regex && regex.match?(value) }
      record.errors.add(attribute, '使用できない文字が含まれています')
    end

  end

end