//
//  QuizDataLoader.m
//  hyakuten
//
//  Created by James Morris on 06/10/2015.
//  Copyright © 2015 rawtoast. All rights reserved.
//

#import "QuizDataLoader.h"
#import "Question.h"
#import "HType.h"

@implementation QuizDataLoader

+(void) generateQuizData:(NSManagedObjectContext *)moc {
    [ QuizDataLoader generateBasicQuiz:moc];
    [ QuizDataLoader generateEssentialQuiz:moc];
}


+(void) generateBasicQuiz:(NSManagedObjectContext *) moc{
    Quiz *quiz = [ Quiz createQuiz: moc];

    quiz.completed = [ NSNumber numberWithBool:NO];
    quiz.section = @"1. Basic Grammar";
    quiz.name = @"Basic Particles";
    quiz.information = @"Particles are one or more Hiragana characters that attach to the end of a word to define the grammatical function of that word in the sentence. Using the correct particles is very important because the meaning of a sentence can completely change just by changing the particles. For example, the sentence 'Eat fish.' can become 'The fish eats.' simply by changing one particle.";
    quiz.url = @"http://www.guidetojapanese.org/learn/grammar/particlesintro";
    quiz.videoId = @"uZb5IOXBByQ";
    
    
    Question *q1 = [ QuizDataLoader makeParticleQuestion:@"俺はビール＿飲む"
                                              withAnswer:@"を"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q1];
    
    Question *q2 = [ QuizDataLoader makeParticleQuestion:@"ボブさん＿東京に行きました。"
                                              withAnswer:@"と"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q2];
    
    Question *q3 = [ QuizDataLoader makeParticleQuestion:@"一緒＿映画を見ませんか？"
                                              withAnswer:@"に"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q3];
    
    Question *q4 = [ QuizDataLoader makeParticleQuestion:@"電車で仕事＿行った。"
                                              withAnswer:@"に"
                                managedObjectContext:moc];
    [ quiz addQuestion: q4];
    
    Question *q5 = [ QuizDataLoader makeParticleQuestion:@"トイレ＿どこですか？"
                                              withAnswer:@"は"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q5];
    
    Question *q6 = [ QuizDataLoader makeParticleQuestion:@"トムさんはケーキ＿食べました。"
                                              withAnswer:@"を"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q6];
    
    Question *q7 = [ QuizDataLoader makeParticleQuestion:@"トムさん＿喫茶店へ来て、コーヒーを飲んだ。"
                                              withAnswer:@"と"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q7];
    
    Question *q8 = [ QuizDataLoader makeParticleQuestion:@"今日スーパー＿行きました？"
                                              withAnswer:@"へ"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q8];
    
    Question *q9 = [ QuizDataLoader makeParticleQuestion:@"あっさて喫茶店で友達＿会います"
                                              withAnswer:@"に"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q9];
    
    Question *q10 = [ QuizDataLoader makeParticleQuestion:@"窓に近い椅子＿座る"
                                              withAnswer:@"に"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q10];
}

+(void) generateEssentialQuiz:(NSManagedObjectContext *) moc{
    Quiz *quiz = [ Quiz createQuiz: moc];
    
    quiz.completed = [ NSNumber numberWithBool:NO];
    quiz.section = @"2. Essential Grammar";
    quiz.name = @"Explanatory の";
    quiz.information = @"The 「の」 particle attached at the end of the last clause of a sentence can also convey an explanatory tone to your sentence. For example, if someone asked you if you have time, you might respond, 'The thing is I'm kind of busy right now.' The abstract generic noun of 'the thing is...' can also be expressed with the 「の」 particle. This type of sentence has an embedded meaning that explains the reason(s) for something else.";
    quiz.url = @"http://www.guidetojapanese.org/learn/grammar/nounparticles";
    quiz.videoId = @"D7wRJug13d0";
    
    Question *q1 = [ QuizDataLoader makeParticleQuestion:@"今は忙し＿。"
                                              withAnswer:@"の"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q1];
    
    Question *q2 = [ QuizDataLoader makeParticleQuestion:@"ボブ＿のだ。"
                                              withAnswer:@"な"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q2];
    
    
    Question *q3 = [ QuizDataLoader makeParticleQuestion:@"すみません。明日仕事に行く＿。"
                                              withAnswer:@"の"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q3];
    
    Question *q4 = [ QuizDataLoader makeParticleQuestion:@"宿題をするのが忘れる＿です。"
                                              withAnswer:@"ん"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q4];
    
    Question *q5 = [ QuizDataLoader makeParticleQuestion:@"昨日はうちの中で寒い＿。"
                                              withAnswer:@"の"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q5];
    
    Question *q6 = [ QuizDataLoader makeParticleQuestion:@"この本はボブさん＿本です。"
                                              withAnswer:@"の"
                                    managedObjectContext:moc];
    [ quiz addQuestion: q6];
    
    Question *q7 = [ QuizDataLoader makeParticleQuestion:@"机＿下が鉛筆や髪があるんだよ。"
                                              withAnswer:@"の"
                                    managedObjectContext:moc];
    
    [ quiz addQuestion: q7];
    
    Question *q8 = [ QuizDataLoader makeParticleQuestion:@"毎日、外国語を勉強する＿大変ですね。"
                                              withAnswer:@"のは"
                                    managedObjectContext:moc];
    
    [ quiz addQuestion: q8];
    
    Question *q9 = [ QuizDataLoader makeParticleQuestion:@"コンビニに行く＿を忘れてしまいました。"
                                              withAnswer:@"こと"
                                    managedObjectContext:moc];
    
    [ quiz addQuestion: q9];

    Question *q10 = [ QuizDataLoader makeParticleQuestion:@"掃除する＿をしてあるんだ。"
                                              withAnswer:@"こと"
                                    managedObjectContext:moc];
    
    [ quiz addQuestion: q10];
}



+(Question *) makeParticleQuestion: (NSString*) question
                withAnswer: (NSString*) answer
      managedObjectContext: (NSManagedObjectContext *) moc {
    
    return [QuizDataLoader makeQuestion:question
                             withAnswer:answer
                                 ofType:PARTICLE
                        withDescription: @"Select the correct particle to fill in the blank"
                   managedObjectContext:moc];
}


    +(Question *) makeQuestion: (NSString*) question
                    withAnswer: (NSString*) answer
                        ofType: (NSString*) questionType
               withDescription: (NSString*) information
          managedObjectContext: (NSManagedObjectContext *) moc {
    
    Question *q = [ Question createQuestion: moc];
    
    q.answer = answer;
    q.sentenceClosed = question;
    q.sentence = [question stringByReplacingOccurrencesOfString:@"＿" withString:answer];
    q.closeType = questionType;
    q.information = information;
    q.closeBase = nil;
    return q;
}



@end
