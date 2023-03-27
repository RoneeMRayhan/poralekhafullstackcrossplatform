<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Question;

class QuestionController extends Controller
{
    //
    public function store(Request $request){

        $request->validate([
            'question'=>'required|max:191',
            'a'=>'required|max:191',
            'b'=>'required|max:191',
            'c'=>'required|max:191',
            'd'=>'required|max:191',
            'answer'=>'required|max:191',
        ]);

        $question = new Question;
        $question->question = $request->question;
        $question->a = $request->a;
        $question->b = $request->b;
        $question->c = $request->c;
        $question->d = $request->d;
        $question->answer = $request->answer;
        $question->save();
        return response()->json(['message'=>'Question Added Successfully'], 200);
    }

    public function index(){
        return Question::all();
    }
}
