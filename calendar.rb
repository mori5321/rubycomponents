require 'active_support'
require 'active_support/core_ext'
require "date"
require 'benchmark'

class Calendar
  def initialize(date)
    @datetime = date
    assign_first_date_and_last_date_of_the_month
  end

  attr_reader :datetime, :first_date, :last_date

  def generate_calendar_hash
    calendar = []

    # 1日までのカレンダー紙面上における空白の日付を生成
    (first_date.wday - 1).times do
      calendar << { date: "" }
    end

    # 1日から末日までの日付を作成。
    1.upto(last_date.day) do |n|
      calendar << { date: n }
    end

    calendar.each_slice(7).to_a
  end

  private
  def assign_first_date_and_last_date_of_the_month
    year, month = datetime.year, datetime.month
    @first_date = Date.new(year, month, 1)
    @last_date = Date.new(year, month, -1)
  end
end


Benchmark.bm 10 do |r|
  r.report "Calendar.generate_calendar_this_month" do
    today = Date.today.advance(years: 1, months: 1)
    calendar =  Calendar.new(today).generate_calendar_hash
    calendar.each {|week| p week }
  end

  r.report "hello world" do
    puts "helloworld"
  end
end





# ~~~アルゴリズム~~~~~~~~~~~~~
# 初日, 末日を取得する

# 1日の曜日(x)を取得する

# ①1(月曜)~からxまで繰り返し dayが空のhashを入れる

# ②1から末日までの hashの配列をつくる。dayには値を入れる。

# ①と②を結合して、each_slice(7)をし、週単位の配列をつくる。

# Task有無だったりをよしなにいれる。



# "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# 参考文献
# upto
# https://www.rubylife.jp/ini/for/index6.html

# Enumerable#each_slice
# https://qiita.com/QUANON/items/749f4a2a79dafdaff57f

# Time#days_in_month
# https://apidock.com/rails/ActiveSupport/CoreExtensions/Time/Calculations/ClassMethods/days_in_month

# active_support
# https://qiita.com/seri_k/items/4818af527bd0e94cc860