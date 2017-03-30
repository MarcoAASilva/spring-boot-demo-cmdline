package br.net.neuromancer.cmdline.vanilla;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication

public class EntryPoint {
	
	private static Logger logger = LoggerFactory.getLogger(EntryPoint.class);

	public static void main (String[] args){
		new SpringApplicationBuilder().sources(EntryPoint.class).run(args);
	}
	
}
