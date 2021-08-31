.PHONY: all

all: build copy

build:
	rm -rf dist/ \
	&& slidev build slides/2019/elixir/slides.md --base /2019/elixir/ --out dist/2019/elixir/ \
	&& slidev build slides/2020/web_traffic_research/slides.md --base /2020/web-traffic-research/ --out dist/2020/web-traffic-research/ \
	&& slidev build slides/2021/i18n_java/slides.md --base /2021/i18n-java/ --out dist/2021/i18n-java/ \
	&& slidev build slides/2021/blog_arch/slides.md --base /2021/blog-arch/ --out dist/2021/blog-arch/ \

export:
	slidev export slides/2019/elixir/slides.md --dark --output dist/2019/elixir/elixir.pdf \
	&& slidev export slides/2020/web_traffic_research/slides.md --dark --output dist/2020/web-traffic-research/web-traffic-research.pdf \
	&& slidev export slides/2021/i18n_java/slides.md --dark --output dist/2021/i18n-java/i18n-java.pdf \
	&& slidev export slides/2021/blog_arch/slides.md --dark --output dist/2021/blog-arch/blog-arch.pdf \

copy:
	cp netlify.toml dist/