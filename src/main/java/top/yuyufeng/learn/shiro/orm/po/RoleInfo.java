package top.yuyufeng.learn.shiro.orm.po;

public class RoleInfo {
    private Long roleId;

    private String roleName;

    public RoleInfo() {
    }

    public RoleInfo(Long roleId, String roleName) {
        this.roleId = roleId;
        this.roleName = roleName;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Long getRoleId() {
        return roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    @Override
    public String toString() {
        return "RoleInfo{" +
                "roleId=" + roleId +
                ", roleName='" + roleName + '\'' +
                '}';
    }
}