//Access to the new NSLinguisticTagger APIs are provided as a public enum as:
public enum NSLinguisticTagger: Int {
	case word
	case sentence
	case paragraph
	case document
}


//To see what units and schemes are available use a class level function:
class func avaliableTagSchemes(for unit: <NSLinguisticTaggerUnit>, language: <String>) -> [NSLinguisticTagScheme]


//Language identification is handled through a new API called dominant language.
tagger.string = “The quick brown fox got old and sat down”
let language = tagger.dominantLanguage


//Code example: Language Identification
import Foundation

// initialize linguistic tagger
let tagger = NSLinguisticTagger(tagSchemes: [.language], options: 0)

// determine dominant language
tagger.string = “Was für ein toller Tag auf unseren Fahrrädern.”
let language = tagger.dominiantLanguage

We can get a bit smarter with language identification, lets assume that we know that language most of the time:

if let language = language {
		tagger.setOrthography(NSOrthography.defaultOrthography 		(forLanguage: language, range: range)

} else {
	language = tagger.dominantLanguage
}


//Code example: Tokenization
import Foundation

let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
let text = “There are some great new APIs for NLP now available for you!”

tagger.string = text

let range = NSRange(location: 0, length: text.uft16.count)
let options = NSLinguisticTagger.options = [.omitPunctuation, .omitWhitespace]

tagger.enumerateTags(in: range, unit: .word, scheme: .tokenType, options: options) {
	tag, tokenRange, stop in
		let token = (text as NSString).substring(with: tokenRange)
		// do something with each token
}


//Code example: Lemmatization
import Foundation

— —
tagger.enumerateTags(in: range, unit: .word, scheme: .lemma, options: options) {
	tag, tokenRange, stop in
		if let lemma = tag?.rawValue {
			// do something with each tag
	}
}


//Code example: Named Entity Recognition
import Foundation

let tagger = NSLinguisticTagger(tagSchemes: [.nameType], options: 0)
let text = “In 1997, Sandy Williamson and Slaughter Fitz-Hugh co-founded CapTech Consulting, Inc. in their hometown of Richmond, VA.”

tagger.string = text

let range = NSRange(location: 0, length: text.utf16.count)
let options = NSLinguisticTagger.options = [.omitPunctuation, .omitWhitespace, .joinNames]
// .joinNames allows us to evaluate named entities that space multiple words like Sandy Williamson
var extractedEntities: [NamedEntity] = []

Let tags: [NSLinguisticTag] = [.personalName, .placeName, .organizationName]

tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: options) {
	tag, tokenRange, stop in
		if let tag = tag, tags.contains(tag) {
			let token = (text as NSString).substring(with: tokenRange)
			extractedEntities.append(NamedEntity(token: token, tag: tag, range: tokenRange
	}
}
// now we can do something with our named entities