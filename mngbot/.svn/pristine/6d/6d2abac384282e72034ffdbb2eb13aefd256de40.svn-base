/**
 * @title	: servlet output stream 변환용 유틸
 * @package	: kr.co.nextlab.util
 * @file	: ResponseWrapperUtil.java
 * @desc	: 
 */
package kr.co.nextlab.util;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.WriteListener;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class ResponseWrapperUtil extends HttpServletResponseWrapper {

	public static final String DEFAULT_ENCODING = "ISO-8859-1";

	/** The Writer we convey. */
	private final StringWriter sw = new StringWriter();

	/** A buffer, alternatively, to accumulate bytes. */
	private final ByteArrayOutputStream bos = new ByteArrayOutputStream();

	/** A ServletOutputStream we convey, tied to this Writer. */
	private final ServletOutputStream sos = new ServletOutputStream() {
		@Override
		public void write(int b) {
			bos.write(b);
		}

		@Override
		public boolean isReady() {
			return false;
		}

		@Override
		public void setWriteListener(WriteListener writeListener) {

		}
	};

	/** 'True' if getWriter() was called; false otherwise. */
	private boolean isWriterUsed;

	/** 'True if getOutputStream() was called; false otherwise. */
	private boolean isStreamUsed;

	/** The HTTP status set by the target. */
	private int status = 200;

	// ************************************************************
	// Constructor and methods
	/** Constructs a new ImportResponseWrapper. */
	public ResponseWrapperUtil(HttpServletResponse response) {
		super(response);
	}

	/** Returns a Writer designed to buffer the output. */
	@Override
	public PrintWriter getWriter() {
		if (isStreamUsed) {
			throw new RuntimeException("import illegal stream");
		}
		isWriterUsed = true;
		return new PrintWriter(sw);
	}

	/** Returns a ServletOutputStream designed to buffer the output. */
	@Override
	public ServletOutputStream getOutputStream() {
		if (isWriterUsed) {
			throw new RuntimeException("import_illegal writer");
		}
		isStreamUsed = true;
		return sos;
	}

	/** Has no effect. */
	@Override
	public void setContentType(String x) {
		// ignore
	}

	/** Has no effect. */
	@Override
	public void setLocale(Locale x) {
		// ignore
	}

	@Override
	public void setStatus(int status) {
		this.status = status;
	}

	public int getStatus() {
		return status;
	}

	/**
	 * Retrieves the buffered output, using the containing tag's 'charEncoding'
	 * attribute, or the tag's default encoding, <b>if necessary</b>.
	 */
	// not simply toString() because we need to throw
	// UnsupportedEncodingException
	public String getString() throws UnsupportedEncodingException {
		if (isWriterUsed) {
			return sw.toString();
		} else if (isStreamUsed) {
			return bos.toString(DEFAULT_ENCODING);
		} else {
			return "";
		}
	}
	
}