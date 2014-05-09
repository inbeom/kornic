# Kornic

[Chronic](https://github.com/mojombo/chronic) in Korean. 자연 언어로 쓰인 날짜
표현을 단일/범위 `Date`로 전환합니다. Calendar view를 대체할 목적으로
작성하였습니다.

## Installation

Add this line to your application's Gemfile:

    gem 'kornic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kornic

## Usage

한국어 날짜 표현을 `Date`로 전환합니다:

    Kornic.parse '내일부터 내일모레'
    => [#<Date: 2014-05-10 ((2456788j,0s,0n),+0s,2299161j)>, #<Date: 2014-05-11 ((2456789j,0s,0n),+0s,2299161j)>]

    Kornic.parse '내일부터 다음주 금요일'
     => [#<Date: 2014-05-10 ((2456788j,0s,0n),+0s,2299161j)>, #<Date: 2014-05-16 ((2456794j,0s,0n),+0s,2299161j)>]

현재 단일/범위 날짜 표현을 지원합니다. 시각 표현은 추후 더할 예정입니다.

## Contributing

1. Fork it ( http://github.com/inbeom/kornic/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
