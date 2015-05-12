#!/usr/bin/env ruby
# vim:set fileencoding=utf-8 ts=2 sw=2 sts=2 et:

# [必須] 1. 使用言語・動作環境
#   ruby 2.1.0p0 (2013-12-25 revision 44422) [i686-linux]
#
# [必須] 2. プログラムの特長・工夫した点等、アピールポイント
#   入力CSVの科目数が増減しても、プログラムが自動的に判別して対応するようにしています
# 
# [任意] 3. もし企業からのスカウトメールがきたらどのくらい積極的にアクションすると思いますか？
#   積極的に会ってみたいと思います

require 'csv'

#INPUT_FILE = 'seiseki/sample_input.csv'
#OUTPUT_FILE = 'sample.output.csv'

INPUT_FILE = 'class_3c_input.csv'
OUTPUT_FILE = 'class_3c.output.csv'

HEADER_NAME = '生徒氏名'
HEADER_TOTAL = '合計'

CSV_OPTS = {
  external_encoding: Encoding::WINDOWS_31J, # CSVの文字コード
  internal_encoding: Encoding::UTF_8,       # プログラムの文字コード
  row_sep: "\r\n",                          # 行区切り
  converters: :integer,
  headers: true,
  return_headers: false,
  write_headers: true,
}.freeze

def main
  students, subject_headers = read_students
  fill_orders_to(students) 
  write_students(students, subject_headers)
end

# CSVから生徒データを読み込みます
# @retrun [Array<Student>, Array<String>] [生徒データ, 科目名ヘッダ]
def read_students
  table = CSV.readlines(INPUT_FILE, CSV_OPTS)
  input_headers = table.headers
  subject_headers = input_headers - [HEADER_NAME] # 科目名のヘッダ

  students = table.map{|row|
    student = Student.new
    student.name = row[HEADER_NAME]
    subject_headers.each do |subject|
      student.scores[subject] = row[subject]
    end
    student.scores[HEADER_TOTAL] = subject_headers.map{|subject| row[subject].to_i}.inject(0, &:+)

    next student
  }

  return students, subject_headers
end

# 生徒データに順位を付与します
# @param students [Array<Student>] 生徒データのリスト
# @return [void]
def fill_orders_to(students)
  return students if students.empty?
  subject_headers = students.first.scores.keys

  subject_headers.each do |subject|
    fill_an_order_to(students, subject)
  end
end

# 生徒データに順位を付与します
# @param students [Array<Student>] 生徒データのリスト
# @param subject [String] 科目名(CSVのヘッダ)
# @return [void]
def fill_an_order_to(students, subject)
  sorted_students = students.sort_by{|student| student.scores[subject]}
  previous_score = nil
  previous_order = nil
  
  sorted_students.reverse_each.each_with_index do |student, index|
    student_count = index + 1
    score = student.scores[subject]

    order = (score == previous_score) ? previous_order : student_count
    student.orders[subject] = order
    
    previous_score = score
    previous_order = order
  end
end

# CSVに生徒データを書き込みます
# @param students [Array<Student>] 生徒データのリスト
# @param subject_headers [Array<String>] [生徒データ, 科目名ヘッダ]
# @return [void]
def write_students(students, subject_headers)
  headers = [HEADER_NAME, *subject_headers, HEADER_TOTAL]

  CSV.open(OUTPUT_FILE, "wb", CSV_OPTS.merge(headers: headers)) do |csv|
    students.each do |student|
      csv << [
        student.name,
        *subject_headers.map{|subject| student.orders[subject]},
        student.orders[HEADER_TOTAL],
      ]
    end
  end
end

class Student
  attr_accessor :name
  attr_reader :scores, :orders

  def initialize
    @name = name
    @scores = {}
    @orders = {}
  end
end


if $0 == __FILE__
  main
end

