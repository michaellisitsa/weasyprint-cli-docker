On Mac via Homebrew, it is hard to get older versions of packages that rely on native binaries such as Weasyprint.

Also Weasyprint has some unpinned dependencies like `pydyf` whose newer versions don't work with older versions of Weasyprint.

Launch via CLI

```
echo "$(cat assets/index.html)" | docker compose run -T weasyprint - out/output.pdf
```
