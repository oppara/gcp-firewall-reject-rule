# gcp-firewall-reject-rule

https://qiita.com/riku-shiru/items/a870edd9dc0b132e092c#comment-766ec1b2f29f358320a6


> 無料枠で1年以上 GCP を使っている者です。
> 
> GCP は中国とオーストラリアからのアクセスは課金対象になります。微量ですがアタックを受けると数円課金対象になります。
> 
> https://cloud.google.com/free/docs/always-free-usage-limits
> 
> 完全に防ぐ事は難しいですが、僕は以下から得られる IP アドレスを全てブロックしています。
> 
> https://ipv4.fetus.jp/cn.txt
> https://ipv4.fetus.jp/au.txt
> 
> さらにその上に fail2ban を仕掛けて数回アタックがあると ban する様にしています。そこまでやると毎月 0 円 ～ 2 円 くらいになります。


ファイアウォールのルール作成

```sh
./setup-fw.sh
```

作成したルールをインスタンスに設定

```sh
./setup-tags.sh web us-west1-b 
```

インスタンスに設定したルールを削除

```sh
./remove-tags.sh web us-west1-b 
```

ファイアウォールのルールの削除

```sh
./remove-fw.sh
```
