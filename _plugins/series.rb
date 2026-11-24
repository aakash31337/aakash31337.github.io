# Generates one page per series.
#
# A post belongs to a series through its first category:
#
#   categories: [Web Security, SSRF]   ->  series "Web Security", sub-topic "SSRF"
#
# Every series gets a page at /series/<slug>/ that lists its posts in reading
# order (oldest first). Optional description and ordering can be set in
# _data/series.yml; without an entry the series is still created and ordered by
# its oldest post.

module SeriesPages
  class Generator < Jekyll::Generator
    safe true
    priority :low

    def generate(site)
      meta = {}
      Array(site.data["series"]).each do |entry|
        next unless entry.is_a?(Hash) && entry["name"]

        meta[entry["name"].to_s] = entry
      end

      groups = Hash.new { |hash, key| hash[key] = [] }

      site.posts.docs.each do |post|
        next if post.data["published"] == false

        categories = Array(post.data["categories"]).compact
        next if categories.empty?

        groups[categories.first.to_s] << post
      end

      ordered = groups.map { |name, posts| [name, posts.sort_by(&:date)] }
      ordered.sort_by! do |name, posts|
        [meta.dig(name, "order") || 999, posts.first.date.to_time, name]
      end

      ordered.each_with_index do |(name, posts), index|
        slug = Jekyll::Utils.slugify(name)
        config = meta[name] || {}

        page = Jekyll::PageWithoutAFile.new(site, site.source, File.join("series", slug), "index.html")
        page.content = ""
        page.data.merge!(
          "layout" => "series",
          "title" => name,
          "permalink" => "/series/#{slug}/",
          "series" => name,
          "series_description" => config["description"],
          "series_order" => config["order"] || 999,
          "series_rank" => index + 1,
          "series_first_date" => posts.first.date,
          "posts" => posts
        )
        site.pages << page
      end
    end
  end
end
