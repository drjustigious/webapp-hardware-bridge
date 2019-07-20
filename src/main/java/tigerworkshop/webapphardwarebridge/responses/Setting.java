package tigerworkshop.webapphardwarebridge.responses;

import java.util.HashMap;

public class Setting {
    String address = "127.0.0.1";
    String bind = "0.0.0.0";
    int port = 12212;
    boolean fallbackToDefaultPrinter = false;

    HashMap<String, Object> authentication = new HashMap<String, Object>() {{
        put("enabled", false);
        put("token", "");
    }};

    HashMap<String, Object> tls = new HashMap<String, Object>() {{
        put("enabled", false);
        put("selfSigned", true);
        put("cert", "tls/default-cert.pem");
        put("key", "tls/default-key.pem");
    }};

    HashMap<String, String> printers = new HashMap<>();
    HashMap<String, String> serials = new HashMap<>();

    public String getAddress() {
        return address;
    }

    public String getBind() {
        return bind;
    }

    public int getPort() {
        return port;
    }

    public Boolean getFallbackToDefaultPrinter() {
        return fallbackToDefaultPrinter;
    }

    public Boolean getAuthenticationEnabled() {
        return (Boolean) authentication.get("enabled");
    }

    public String getAuthenticationToken() {
        return (String) authentication.get("token");
    }

    public Boolean getTLSEnabled() {
        return (boolean) tls.get("enabled");
    }

    public Boolean getTLSSelfSigned() {
        return (Boolean) tls.get("selfSigned");
    }

    public String getTLSCert() {
        return (String) tls.get("cert");
    }

    public String getTLSKey() {
        return (String) tls.get("key");
    }

    public HashMap<String, String> getPrinters() {
        return printers;
    }

    public void setPrinters(HashMap<String, String> printers) {
        this.printers = printers;
    }

    public HashMap<String, String> getSerials() {
        return serials;
    }

    public void setSerials(HashMap<String, String> serials) {
        this.serials = serials;
    }

    public String getUri() {
        return (getTLSEnabled() ? "wss" : "ws") + "://" + getAddress() + ":" + getPort();
    }
}