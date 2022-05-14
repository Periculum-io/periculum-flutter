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
        min: json["min"],
        max: json["max"],
        percentageOfTransactionsInBucket:
            json["percentageOfTransactionsInBucket"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
        "percentageOfTransactionsInBucket": percentageOfTransactionsInBucket,
      };
}
