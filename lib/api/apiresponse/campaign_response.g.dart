// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignResponse _$CampaignResponseFromJson(Map<String, dynamic> json) =>
    CampaignResponse(
      campaign_id: json['campaign_id'] as int,
      publisher_id: json['publisher_id'] as int,
      goal_name: json['goal_name'] as String,
      campaign_name: json['campaign_name'] as String,
      currency: json['currency'] as String,
      revenue: json['revenue'] as int,
      payout: json['payout'] as int,
      campaign_revenue: (json['campaign_revenue'] as num).toDouble(),
      approvedConversions: json['approvedConversions'] as int,
      profit: json['profit'] as int,
      saleAmount: json['saleAmount'] as int,
    );

Map<String, dynamic> _$CampaignResponseToJson(CampaignResponse instance) =>
    <String, dynamic>{
      'campaign_id': instance.campaign_id,
      'publisher_id': instance.publisher_id,
      'goal_name': instance.goal_name,
      'campaign_name': instance.campaign_name,
      'currency': instance.currency,
      'revenue': instance.revenue,
      'payout': instance.payout,
      'campaign_revenue': instance.campaign_revenue,
      'approvedConversions': instance.approvedConversions,
      'profit': instance.profit,
      'saleAmount': instance.saleAmount,
    };
