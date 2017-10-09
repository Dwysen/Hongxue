//
//	HXBattleData.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct HXBattleData{

	var createTime : Int!
	var delFlag : Int!
	var descriptionField : String!
	var id : Int!
	var onoff : Int!
	var reviewLink : String!
	var reviewUrl : String!
	var sortNumber : Int!
	var updateTime : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		createTime = dictionary["createTime"] as? Int
		delFlag = dictionary["delFlag"] as? Int
		descriptionField = dictionary["description"] as? String
		id = dictionary["id"] as? Int
		onoff = dictionary["onoff"] as? Int
		reviewLink = dictionary["reviewLink"] as? String
		reviewUrl = dictionary["reviewUrl"] as? String
		sortNumber = dictionary["sortNumber"] as? Int
		updateTime = dictionary["updateTime"] as? Int
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if createTime != nil{
			dictionary["createTime"] = createTime
		}
		if delFlag != nil{
			dictionary["delFlag"] = delFlag
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if id != nil{
			dictionary["id"] = id
		}
		if onoff != nil{
			dictionary["onoff"] = onoff
		}
		if reviewLink != nil{
			dictionary["reviewLink"] = reviewLink
		}
		if reviewUrl != nil{
			dictionary["reviewUrl"] = reviewUrl
		}
		if sortNumber != nil{
			dictionary["sortNumber"] = sortNumber
		}
		if updateTime != nil{
			dictionary["updateTime"] = updateTime
		}
		return dictionary
	}

}