class Breakdown {
  Breakdown({
    required this.min,
    required this.max,
    required this.percentageOfTransactionsInBucket,
  });

  num min;
  num max;
  num percentageOfTransactionsInBucket;

  factory Breakdown.fromJson(Map<String, dynamic> json) => Breakdown(
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        percentageOfTransactionsInBucket:
            json["percentageOfTransactionsInBucket"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
        "percentageOfTransactionsInBucket": percentageOfTransactionsInBucket,
      };
}
