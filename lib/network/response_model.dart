class JSON {
  final String? kind;
  final Url? url;
  final Queries? queries;
  final Context? context;
  final SearchInformation? searchInformation;
  final List<Items>? items;

  JSON({
    this.kind,
    this.url,
    this.queries,
    this.context,
    this.searchInformation,
    this.items,
  });

  JSON.fromJson(Map<String, dynamic> json)
      : kind = json['kind'] as String?,
        url = (json['url'] as Map<String, dynamic>?) != null
            ? Url.fromJson(json['url'] as Map<String, dynamic>)
            : null,
        queries = (json['queries'] as Map<String, dynamic>?) != null
            ? Queries.fromJson(json['queries'] as Map<String, dynamic>)
            : null,
        context = (json['context'] as Map<String, dynamic>?) != null
            ? Context.fromJson(json['context'] as Map<String, dynamic>)
            : null,
        searchInformation =
            (json['searchInformation'] as Map<String, dynamic>?) != null
                ? SearchInformation.fromJson(
                    json['searchInformation'] as Map<String, dynamic>)
                : null,
        items = (json['items'] as List?)
            ?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'url': url?.toJson(),
        'queries': queries?.toJson(),
        'context': context?.toJson(),
        'searchInformation': searchInformation?.toJson(),
        'items': items?.map((e) => e.toJson()).toList()
      };
}

class Url {
  final String? type;
  final String? template;

  Url({
    this.type,
    this.template,
  });

  Url.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        template = json['template'] as String?;

  Map<String, dynamic> toJson() => {'type': type, 'template': template};
}

class Queries {
  final List<Request>? request;
  final List<NextPage>? nextPage;

  Queries({
    this.request,
    this.nextPage,
  });

  Queries.fromJson(Map<String, dynamic> json)
      : request = (json['request'] as List?)
            ?.map((dynamic e) => Request.fromJson(e as Map<String, dynamic>))
            .toList(),
        nextPage = (json['nextPage'] as List?)
            ?.map((dynamic e) => NextPage.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'request': request?.map((e) => e.toJson()).toList(),
        'nextPage': nextPage?.map((e) => e.toJson()).toList()
      };
}

class Request {
  final String? title;
  final String? totalResults;
  final String? searchTerms;
  final int? count;
  final int? startIndex;
  final String? inputEncoding;
  final String? outputEncoding;
  final String? safe;
  final String? cx;

  Request({
    this.title,
    this.totalResults,
    this.searchTerms,
    this.count,
    this.startIndex,
    this.inputEncoding,
    this.outputEncoding,
    this.safe,
    this.cx,
  });

  Request.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        totalResults = json['totalResults'] as String?,
        searchTerms = json['searchTerms'] as String?,
        count = json['count'] as int?,
        startIndex = json['startIndex'] as int?,
        inputEncoding = json['inputEncoding'] as String?,
        outputEncoding = json['outputEncoding'] as String?,
        safe = json['safe'] as String?,
        cx = json['cx'] as String?;

  Map<String, dynamic> toJson() => {
        'title': title,
        'totalResults': totalResults,
        'searchTerms': searchTerms,
        'count': count,
        'startIndex': startIndex,
        'inputEncoding': inputEncoding,
        'outputEncoding': outputEncoding,
        'safe': safe,
        'cx': cx
      };
}

class NextPage {
  final String? title;
  final String? totalResults;
  final String? searchTerms;
  final int? count;
  final int? startIndex;
  final String? inputEncoding;
  final String? outputEncoding;
  final String? safe;
  final String? cx;

  NextPage({
    this.title,
    this.totalResults,
    this.searchTerms,
    this.count,
    this.startIndex,
    this.inputEncoding,
    this.outputEncoding,
    this.safe,
    this.cx,
  });

  NextPage.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        totalResults = json['totalResults'] as String?,
        searchTerms = json['searchTerms'] as String?,
        count = json['count'] as int?,
        startIndex = json['startIndex'] as int?,
        inputEncoding = json['inputEncoding'] as String?,
        outputEncoding = json['outputEncoding'] as String?,
        safe = json['safe'] as String?,
        cx = json['cx'] as String?;

  Map<String, dynamic> toJson() => {
        'title': title,
        'totalResults': totalResults,
        'searchTerms': searchTerms,
        'count': count,
        'startIndex': startIndex,
        'inputEncoding': inputEncoding,
        'outputEncoding': outputEncoding,
        'safe': safe,
        'cx': cx
      };
}

class Context {
  final String? title;

  Context({
    this.title,
  });

  Context.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?;

  Map<String, dynamic> toJson() => {'title': title};
}

class SearchInformation {
  final double? searchTime;
  final String? formattedSearchTime;
  final String? totalResults;
  final String? formattedTotalResults;

  SearchInformation({
    this.searchTime,
    this.formattedSearchTime,
    this.totalResults,
    this.formattedTotalResults,
  });

  SearchInformation.fromJson(Map<String, dynamic> json)
      : searchTime = json['searchTime'] as double?,
        formattedSearchTime = json['formattedSearchTime'] as String?,
        totalResults = json['totalResults'] as String?,
        formattedTotalResults = json['formattedTotalResults'] as String?;

  Map<String, dynamic> toJson() => {
        'searchTime': searchTime,
        'formattedSearchTime': formattedSearchTime,
        'totalResults': totalResults,
        'formattedTotalResults': formattedTotalResults
      };
}

class Items {
  final String? kind;
  final String? title;
  final String? htmlTitle;
  final String? link;
  final String? displayLink;
  final String? snippet;
  final String? htmlSnippet;
  final String? cacheId;
  final String? formattedUrl;
  final String? htmlFormattedUrl;
  final Pagemap? pagemap;

  Items({
    this.kind,
    this.title,
    this.htmlTitle,
    this.link,
    this.displayLink,
    this.snippet,
    this.htmlSnippet,
    this.cacheId,
    this.formattedUrl,
    this.htmlFormattedUrl,
    this.pagemap,
  });

  Items.fromJson(Map<String, dynamic> json)
      : kind = json['kind'] as String?,
        title = json['title'] as String?,
        htmlTitle = json['htmlTitle'] as String?,
        link = json['link'] as String?,
        displayLink = json['displayLink'] as String?,
        snippet = json['snippet'] as String?,
        htmlSnippet = json['htmlSnippet'] as String?,
        cacheId = json['cacheId'] as String?,
        formattedUrl = json['formattedUrl'] as String?,
        htmlFormattedUrl = json['htmlFormattedUrl'] as String?,
        pagemap = (json['pagemap'] as Map<String, dynamic>?) != null
            ? Pagemap.fromJson(json['pagemap'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'title': title,
        'htmlTitle': htmlTitle,
        'link': link,
        'displayLink': displayLink,
        'snippet': snippet,
        'htmlSnippet': htmlSnippet,
        'cacheId': cacheId,
        'formattedUrl': formattedUrl,
        'htmlFormattedUrl': htmlFormattedUrl,
        'pagemap': pagemap?.toJson()
      };
}

class Pagemap {
  final List<CseThumbnail>? cseThumbnail;
  final List<Imageobject>? imageobject;
  final List<Metatags>? metatags;
  final List<CseImage>? cseImage;

  Pagemap({
    this.cseThumbnail,
    this.imageobject,
    this.metatags,
    this.cseImage,
  });

  Pagemap.fromJson(Map<String, dynamic> json)
      : cseThumbnail = (json['cse_thumbnail'] as List?)
            ?.map(
                (dynamic e) => CseThumbnail.fromJson(e as Map<String, dynamic>))
            .toList(),
        imageobject = (json['imageobject'] as List?)
            ?.map(
                (dynamic e) => Imageobject.fromJson(e as Map<String, dynamic>))
            .toList(),
        metatags = (json['metatags'] as List?)
            ?.map((dynamic e) => Metatags.fromJson(e as Map<String, dynamic>))
            .toList(),
        cseImage = (json['cse_image'] as List?)
            ?.map((dynamic e) => CseImage.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'cse_thumbnail': cseThumbnail?.map((e) => e.toJson()).toList(),
        'imageobject': imageobject?.map((e) => e.toJson()).toList(),
        'metatags': metatags?.map((e) => e.toJson()).toList(),
        'cse_image': cseImage?.map((e) => e.toJson()).toList()
      };
}

class CseThumbnail {
  final String? src;
  final String? width;
  final String? height;

  CseThumbnail({
    this.src,
    this.width,
    this.height,
  });

  CseThumbnail.fromJson(Map<String, dynamic> json)
      : src = json['src'] as String?,
        width = json['width'] as String?,
        height = json['height'] as String?;

  Map<String, dynamic> toJson() =>
      {'src': src, 'width': width, 'height': height};
}

class Imageobject {
  final String? contenturl;

  Imageobject({
    this.contenturl,
  });

  Imageobject.fromJson(Map<String, dynamic> json)
      : contenturl = json['contenturl'] as String?;

  Map<String, dynamic> toJson() => {'contenturl': contenturl};
}

class Metatags {
  final String? template;
  final String? twitterCard;
  final String? twitterTitle;
  final String? themeColor;
  final String? twitterSite;
  final String? twitterUrl;
  final String? viewport;
  final String? twitterDescription;
  final String? twitterCreator;
  final String? twitterImage;

  Metatags({
    this.template,
    this.twitterCard,
    this.twitterTitle,
    this.themeColor,
    this.twitterSite,
    this.twitterUrl,
    this.viewport,
    this.twitterDescription,
    this.twitterCreator,
    this.twitterImage,
  });

  Metatags.fromJson(Map<String, dynamic> json)
      : template = json['template'] as String?,
        twitterCard = json['twitter:card'] as String?,
        twitterTitle = json['twitter:title'] as String?,
        themeColor = json['theme-color'] as String?,
        twitterSite = json['twitter:site'] as String?,
        twitterUrl = json['twitter:url'] as String?,
        viewport = json['viewport'] as String?,
        twitterDescription = json['twitter:description'] as String?,
        twitterCreator = json['twitter:creator'] as String?,
        twitterImage = json['twitter:image'] as String?;

  Map<String, dynamic> toJson() => {
        'template': template,
        'twitter:card': twitterCard,
        'twitter:title': twitterTitle,
        'theme-color': themeColor,
        'twitter:site': twitterSite,
        'twitter:url': twitterUrl,
        'viewport': viewport,
        'twitter:description': twitterDescription,
        'twitter:creator': twitterCreator,
        'twitter:image': twitterImage
      };
}

class CseImage {
  final String? src;

  CseImage({
    this.src,
  });

  CseImage.fromJson(Map<String, dynamic> json) : src = json['src'] as String?;

  Map<String, dynamic> toJson() => {'src': src};
}
