//
//  XMLParsing.swift
//  RecipeApp
//
//  Created by Shyan Hua on 22/10/2020.
//  Copyright © 2020 Shyan Hua. All rights reserved.
//

import Foundation

struct RSS
{
    var RecipeTypes: String
    var Recipe: String
}

class XMLParsing: NSObject, XMLParserDelegate
{
    private var myData: Data
    private var currentElementName = ""
    private var inItem = false
    private var item : RSS
    
    var ready = false
    var header: RSS
    var items: [RSS]
    
    override init()
    {
        myData = "".data(using: .ascii)!
        header = RSS(RecipeTypes: "", Recipe: "")
        items = []
        item = header
    }
    
    deinit
    {
        
    }
    
    func setData(data: Data) -> Void
    {
        if data == nil
        {
            return
        }
        
        myData = data
    }
    
    func parse() -> Void
    {
        let parser = XMLParser(data: myData)
        parser.delegate = self
        parser.parse()
    }
    
    func parserDidEndDocument(_ parser: XMLParser)
    {
        ready = true
    }
    
    func parserDidStartDocument(_ parser: XMLParser)
    {
        ready = false
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        currentElementName = elementName
        
        if elementName == "RecipeType"
        {
            inItem = false
            items.append(item)
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
    {
        currentElementName = elementName
        
        if elementName == "RecipeType"
        {
            inItem = false
            item = RSS(RecipeTypes: "", Recipe: "")
        }
    }
    
    func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data)
    {
        if !inItem
        {
            return
        }
        
        switch currentElementName.lowercased()
        {
        case "recipe1":
            break
        case "recipe2":
            break
        case "recipe3":
            break
        case "recipe4":
            break
            
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if !inItem
        {
            return
        }
        
        switch currentElementName.lowercased()
        {
        case "recipe1":
            break
        case "recipe2":
            break
        case "recipe3":
            break
        case "recipe4":
            break
            
        default:
            break
        }
    }
}
