/*
 * generated by Xtext 2.15.0
 */
grammar InternalMml;

options {
	superClass=AbstractInternalAntlrParser;
}

@lexer::header {
package org.xtext.example.mydsl.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package org.xtext.example.mydsl.parser.antlr.internal;

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import org.xtext.example.mydsl.services.MmlGrammarAccess;

}

@parser::members {

 	private MmlGrammarAccess grammarAccess;

    public InternalMmlParser(TokenStream input, MmlGrammarAccess grammarAccess) {
        this(input);
        this.grammarAccess = grammarAccess;
        registerRules(grammarAccess.getGrammar());
    }

    @Override
    protected String getFirstRuleName() {
    	return "MMLModel";
   	}

   	@Override
   	protected MmlGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}

}

@rulecatch {
    catch (RecognitionException re) {
        recover(input,re);
        appendSkippedTokens();
    }
}

// Entry rule entryRuleMMLModel
entryRuleMMLModel returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getMMLModelRule()); }
	iv_ruleMMLModel=ruleMMLModel
	{ $current=$iv_ruleMMLModel.current; }
	EOF;

// Rule MMLModel
ruleMMLModel returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			{
				newCompositeNode(grammarAccess.getMMLModelAccess().getInputDataInputParserRuleCall_0());
			}
			lv_input_0_0=ruleDataInput
			{
				if ($current==null) {
					$current = createModelElementForParent(grammarAccess.getMMLModelRule());
				}
				set(
					$current,
					"input",
					lv_input_0_0,
					"org.xtext.example.mydsl.Mml.DataInput");
				afterParserOrEnumRuleCall();
			}
		)
	)
;

// Entry rule entryRuleDataInput
entryRuleDataInput returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getDataInputRule()); }
	iv_ruleDataInput=ruleDataInput
	{ $current=$iv_ruleDataInput.current; }
	EOF;

// Rule DataInput
ruleDataInput returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='input'
		{
			newLeafNode(otherlv_0, grammarAccess.getDataInputAccess().getInputKeyword_0());
		}
		(
			(
				lv_filelocation_1_0=RULE_STRING
				{
					newLeafNode(lv_filelocation_1_0, grammarAccess.getDataInputAccess().getFilelocationSTRINGTerminalRuleCall_1_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getDataInputRule());
					}
					setWithLastConsumed(
						$current,
						"filelocation",
						lv_filelocation_1_0,
						"org.eclipse.xtext.common.Terminals.STRING");
				}
			)
		)
	)
;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;