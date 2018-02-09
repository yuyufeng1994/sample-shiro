package top.yuyufeng.learn.shiro.orm.po;

public class PermissionInfo {
    private Long permissionId;

    private String permissionName;

    public PermissionInfo() {
    }

    public PermissionInfo(Long permissionId, String permissionName) {
        this.permissionId = permissionId;
        this.permissionName = permissionName;
    }


    public void setPermissionId(Long permissionId) {
        this.permissionId = permissionId;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }


    public Long getPermissionId() {
        return permissionId;
    }

    public String getPermissionName() {
        return permissionName;
    }

    @Override
    public String toString() {
        return "PermissionInfo{" +
                "permissionId=" + permissionId +
                ", permissionName='" + permissionName + '\'' +
                '}';
    }
}