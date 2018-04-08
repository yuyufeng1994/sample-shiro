package top.yuyufeng.learn.shiro.orm.po;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "permission_info")
public class PermissionInfo {
    @Id
    @Column(name = "permission_id")
    private Long permissionId;

    @Column(name = "permission_name")
    private String permissionName;

    @Column(name = "permission_notes")
    private String permissionNotes;

    public String getPermissionNotes() {
        return permissionNotes;
    }

    public void setPermissionNotes(String permissionNotes) {
        this.permissionNotes = permissionNotes;
    }



    public PermissionInfo() {
        super();
    }

    /**
     * @return permission_id
     */
    public Long getPermissionId() {
        return permissionId;
    }

    /**
     * @param permissionId
     */
    public void setPermissionId(Long permissionId) {
        this.permissionId = permissionId;
    }

    /**
     * @return permission_name
     */
    public String getPermissionName() {
        return permissionName;
    }

    /**
     * @param permissionName
     */
    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName == null ? null : permissionName.trim();
    }
}