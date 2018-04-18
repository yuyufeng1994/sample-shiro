package top.yuyufeng.sample.admin.orm.vo;

import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/4/16.
 */
public class TreeVO {
    private Long dataId;
    private String text;
    private String name;
    private Long dataParent;
    private List<TreeVO> nodes;

    public Long getDataParent() {
        return dataParent;
    }

    public void setDataParent(Long dataParent) {
        this.dataParent = dataParent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getDataId() {
        return dataId;
    }

    public void setDataId(Long dataId) {
        this.dataId = dataId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<TreeVO> getNodes() {
        return nodes;
    }

    public void setNodes(List<TreeVO> nodes) {
        this.nodes = nodes;
    }

}
