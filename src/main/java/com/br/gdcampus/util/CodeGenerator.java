package com.br.gdcampus.util;

import java.security.SecureRandom;

public class CodeGenerator {

	private static final SecureRandom random = new SecureRandom();

    public static String generateVerificationCode() {
        int number = random.nextInt(999999);  // 0 ~ 999999 사이의 숫자 생성
        return String.format("%06d", number);  // 6자리 포맷
    }
}
