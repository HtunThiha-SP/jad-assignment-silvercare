package util;

public class OperationResponse {
	private Boolean success;
	private String message;
	private String code;
	
	public OperationResponse() {}

	public OperationResponse(Boolean success, String message) {
		this.success = success;
		this.message = message;
	}
	
	public OperationResponse(Boolean success, String message, String code) {
		this.success = success;
		this.message = message;
		this.code = code;
	}

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
