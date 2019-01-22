/*
 * generated by Xtext 2.15.0
 */
package org.xtext.example.mydsl.serializer;

import com.google.inject.Inject;
import java.util.Set;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.xtext.Action;
import org.eclipse.xtext.Parameter;
import org.eclipse.xtext.ParserRule;
import org.eclipse.xtext.serializer.ISerializationContext;
import org.eclipse.xtext.serializer.acceptor.SequenceFeeder;
import org.eclipse.xtext.serializer.sequencer.AbstractDelegatingSemanticSequencer;
import org.eclipse.xtext.serializer.sequencer.ITransientValueService.ValueTransient;
import org.xtext.example.mydsl.mml.DataInput;
import org.xtext.example.mydsl.mml.MMLModel;
import org.xtext.example.mydsl.mml.MmlPackage;
import org.xtext.example.mydsl.services.MmlGrammarAccess;

@SuppressWarnings("all")
public class MmlSemanticSequencer extends AbstractDelegatingSemanticSequencer {

	@Inject
	private MmlGrammarAccess grammarAccess;
	
	@Override
	public void sequence(ISerializationContext context, EObject semanticObject) {
		EPackage epackage = semanticObject.eClass().getEPackage();
		ParserRule rule = context.getParserRule();
		Action action = context.getAssignedAction();
		Set<Parameter> parameters = context.getEnabledBooleanParameters();
		if (epackage == MmlPackage.eINSTANCE)
			switch (semanticObject.eClass().getClassifierID()) {
			case MmlPackage.DATA_INPUT:
				sequence_DataInput(context, (DataInput) semanticObject); 
				return; 
			case MmlPackage.MML_MODEL:
				sequence_MMLModel(context, (MMLModel) semanticObject); 
				return; 
			}
		if (errorAcceptor != null)
			errorAcceptor.accept(diagnosticProvider.createInvalidContextOrTypeDiagnostic(semanticObject, context));
	}
	
	/**
	 * Contexts:
	 *     DataInput returns DataInput
	 *
	 * Constraint:
	 *     filelocation=STRING
	 */
	protected void sequence_DataInput(ISerializationContext context, DataInput semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, MmlPackage.Literals.DATA_INPUT__FILELOCATION) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, MmlPackage.Literals.DATA_INPUT__FILELOCATION));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getDataInputAccess().getFilelocationSTRINGTerminalRuleCall_1_0(), semanticObject.getFilelocation());
		feeder.finish();
	}
	
	
	/**
	 * Contexts:
	 *     MMLModel returns MMLModel
	 *
	 * Constraint:
	 *     input=DataInput
	 */
	protected void sequence_MMLModel(ISerializationContext context, MMLModel semanticObject) {
		if (errorAcceptor != null) {
			if (transientValues.isValueTransient(semanticObject, MmlPackage.Literals.MML_MODEL__INPUT) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, MmlPackage.Literals.MML_MODEL__INPUT));
		}
		SequenceFeeder feeder = createSequencerFeeder(context, semanticObject);
		feeder.accept(grammarAccess.getMMLModelAccess().getInputDataInputParserRuleCall_0(), semanticObject.getInput());
		feeder.finish();
	}
	
	
}