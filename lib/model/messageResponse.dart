class MessageResponse {
  List<HydraMember>? hydraMember;
  int? hydraTotalItems;
  HydraView? hydraView;
  HydraSearch? hydraSearch;

  MessageResponse(
      {this.hydraMember,
        this.hydraTotalItems,
        this.hydraView,
        this.hydraSearch});

  MessageResponse.fromJson(Map<String, dynamic> json) {
    if (json['hydra:member'] != null) {
      hydraMember = <HydraMember>[];
      json['hydra:member'].forEach((v) {
        hydraMember!.add(new HydraMember.fromJson(v));
      });
    }
    hydraTotalItems = json['hydra:totalItems'];
    hydraView = json['hydra:view'] != null
        ? new HydraView.fromJson(json['hydra:view'])
        : null;
    hydraSearch = json['hydra:search'] != null
        ? new HydraSearch.fromJson(json['hydra:search'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hydraMember != null) {
      data['hydra:member'] = this.hydraMember!.map((v) => v.toJson()).toList();
    }
    data['hydra:totalItems'] = this.hydraTotalItems;
    if (this.hydraView != null) {
      data['hydra:view'] = this.hydraView!.toJson();
    }
    if (this.hydraSearch != null) {
      data['hydra:search'] = this.hydraSearch!.toJson();
    }
    return data;
  }
}

class HydraMember {
  String? id_;
  String? type;
  String? context;
  String? id;
  String? accountId;
  String? msgid;
  From? from;
  List<To>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  String? createdAt;
  String? updatedAt;

  HydraMember(
      {this.id_,
        this.type,
        this.context,
        this.id,
        this.accountId,
        this.msgid,
        this.from,
        this.to,
        this.subject,
        this.intro,
        this.seen,
        this.isDeleted,
        this.hasAttachments,
        this.size,
        this.downloadUrl,
        this.createdAt,
        this.updatedAt});

  HydraMember.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    type = json['@type'];
    context = json['@context'];
    id = json['id'];
    accountId = json['accountId'];
    msgid = json['msgid'];
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    if (json['to'] != null) {
      to = <To>[];
      json['to'].forEach((v) {
        to!.add(new To.fromJson(v));
      });
    }
    subject = json['subject'];
    intro = json['intro'];
    seen = json['seen'];
    isDeleted = json['isDeleted'];
    hasAttachments = json['hasAttachments'];
    size = json['size'];
    downloadUrl = json['downloadUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['@context'] = this.context;
    data['id'] = this.id;
    data['accountId'] = this.accountId;
    data['msgid'] = this.msgid;
    if (this.from != null) {
      data['from'] = this.from!.toJson();
    }
    if (this.to != null) {
      data['to'] = this.to!.map((v) => v.toJson()).toList();
    }
    data['subject'] = this.subject;
    data['intro'] = this.intro;
    data['seen'] = this.seen;
    data['isDeleted'] = this.isDeleted;
    data['hasAttachments'] = this.hasAttachments;
    data['size'] = this.size;
    data['downloadUrl'] = this.downloadUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class From {
  String? address;
  String? name;

  From({this.address, this.name});

  From.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['name'] = this.name;
    return data;
  }
}

class HydraView {
  String? id;
  String? type;
  String? hydraFirst;
  String? hydraLast;
  String? hydraPrevious;
  String? hydraNext;

  HydraView(
      {this.id,
        this.type,
        this.hydraFirst,
        this.hydraLast,
        this.hydraPrevious,
        this.hydraNext});

  HydraView.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    type = json['@type'];
    hydraFirst = json['hydra:first'];
    hydraLast = json['hydra:last'];
    hydraPrevious = json['hydra:previous'];
    hydraNext = json['hydra:next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['hydra:first'] = this.hydraFirst;
    data['hydra:last'] = this.hydraLast;
    data['hydra:previous'] = this.hydraPrevious;
    data['hydra:next'] = this.hydraNext;
    return data;
  }
}

class HydraSearch {
  String? type;
  String? hydraTemplate;
  String? hydraVariableRepresentation;
  List<HydraMapping>? hydraMapping;

  HydraSearch(
      {this.type,
        this.hydraTemplate,
        this.hydraVariableRepresentation,
        this.hydraMapping});

  HydraSearch.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    hydraTemplate = json['hydra:template'];
    hydraVariableRepresentation = json['hydra:variableRepresentation'];
    if (json['hydra:mapping'] != null) {
      hydraMapping = <HydraMapping>[];
      json['hydra:mapping'].forEach((v) {
        hydraMapping!.add(new HydraMapping.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['hydra:template'] = this.hydraTemplate;
    data['hydra:variableRepresentation'] = this.hydraVariableRepresentation;
    if (this.hydraMapping != null) {
      data['hydra:mapping'] =
          this.hydraMapping!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HydraMapping {
  String? type;
  String? variable;
  String? property;
  bool? required;

  HydraMapping({this.type, this.variable, this.property, this.required});

  HydraMapping.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    variable = json['variable'];
    property = json['property'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['variable'] = this.variable;
    data['property'] = this.property;
    data['required'] = this.required;
    return data;
  }
}


class To {
  List<To>? to;

  To({this.to});

  To.fromJson(Map<String, dynamic> json) {
    if (json['to'] != null) {
      to = <To>[];
      json['to'].forEach((v) {
        to!.add(new To.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.to != null) {
      data['to'] = this.to!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


