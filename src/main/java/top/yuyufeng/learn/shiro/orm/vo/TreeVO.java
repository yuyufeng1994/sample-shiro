package top.yuyufeng.learn.shiro.orm.vo;

import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/4/16.
 */
public class TreeVO {
    private Long dataId;
    private String text;
    private List<TreeVO> nodes;

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

    @Override
    public String toString() {
        return "TreeVO{" +
                "dataId=" + dataId +
                ", text='" + text + '\'' +
                '}';
    }
}
