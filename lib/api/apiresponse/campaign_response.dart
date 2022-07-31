/**
 * Created by : Ayush Kumar
 * Created on : 30-07-2022
 */
import 'package:json_annotation/json_annotation.dart';

part 'campaign_response.g.dart';

@JsonSerializable()
class CampaignResponse {
  /// The generated code assumes these values exist in JSON.

  final int campaign_id;
  final int publisher_id;
  final String goal_name;
  final String campaign_name;
  final String currency;
  final int revenue;
  final int payout;
  final double campaign_revenue;
  final int approvedConversions;
  final int profit;
  final int saleAmount;

  CampaignResponse({
    required this.campaign_id,
    required this.publisher_id,
    required this.goal_name,
    required this.campaign_name,
    required this.currency,
    required this.revenue,
    required this.payout,
    required this.campaign_revenue,
    required this.approvedConversions,
    required this.profit,
    required this.saleAmount,
  });

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  /// Connect the generated [_$CampaignResponseFromJson] function to the `fromJson`
  /// factory.
  factory CampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$CampaignResponseFromJson(json);

  /// Connect the generated [_$CampaignResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CampaignResponseToJson(this);
}
