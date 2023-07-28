
class PericulumResponse{

   num? mobileInsightsOverviewKey;
   bool status;
   num statusCode;
   String? message;

   PericulumResponse(
       {required this.mobileInsightsOverviewKey,
          required this.statusCode,
          required this.status,
        this.message});

   @override
   String toString() {
      return '{mobileInsightsOverviewKey: $mobileInsightsOverviewKey, statusCode: $statusCode,  status: $status, message: $message }';
   }

}