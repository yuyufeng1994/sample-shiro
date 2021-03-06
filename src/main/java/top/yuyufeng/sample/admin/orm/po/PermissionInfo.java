package top.yuyufeng.sample.admin.orm.po;

import com.sun.org.apache.xpath.internal.operations.Bool;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "permission_info")
public class PermissionInfo {
    @Id
    @Column(name = "permission_id")
    private Long permissionId;

    @Column(name = "permission_name")
    private String permissionName;

    @Column(name = "permission_notes")
    private String permissionNotes;

    @Column(name = "parent_id")
    private Long parentId;

    @Transient
    private Boolean checked;

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

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

    @Override
    public String toString() {
        return "PermissionInfo{" +
                "permissionId=" + permissionId +
                ", permissionName='" + permissionName + '\'' +
                ", permissionNotes='" + permissionNotes + '\'' +
                ", parentId=" + parentId +
                ", checked=" + checked +
                '}';
    }
}