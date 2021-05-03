/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.senac.compiladores.syntactic.sint_antlr;


import java.io.IOException;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;



/**
 *
 * @author robson
 */
public class Main {
    public static void main(String[] args) throws IOException {
        CharStream cs = CharStreams.fromFileName(args[0]);
        compLexer lexer = new compLexer(cs);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        compParser parser = new compParser(tokens);
        parser.program();
        
    }
}
