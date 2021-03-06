Class {
	#name : #AlpImplementorsIndexTest,
	#superclass : #AlpIndexTestCase,
	#category : #'Aleph-Tests'
}

{ #category : #accessing }
AlpImplementorsIndexTest >> indexClass [

	^ AlpImplementorsIndex
]

{ #category : #tests }
AlpImplementorsIndexTest >> testIndexMethod [
	
	self index methodAdded: self compiledMethod1.
	
	self 
		assert: (self index referencesTo: #method1) size
		equals: 1
]

{ #category : #tests }
AlpImplementorsIndexTest >> testMethodAdded [
	"Self as indexMethod"

	self testIndexMethod
]

{ #category : #tests }
AlpImplementorsIndexTest >> testMethodModifiedFromTo [

	self index methodAdded: self compiledMethod1.

	self index
		methodModifiedFrom: self compiledMethod1
		to: self compiledMethod1Modified.
	
	self 
		assert: (self index referencesTo: #method1) size
		equals: 1
]

{ #category : #tests }
AlpImplementorsIndexTest >> testMethodRemoved [

	self index methodAdded: self compiledMethod1.
	self index methodRemoved: self compiledMethod1.
	
	self 
		assert: (self index referencesTo: #method1) size
		equals: 0
]
