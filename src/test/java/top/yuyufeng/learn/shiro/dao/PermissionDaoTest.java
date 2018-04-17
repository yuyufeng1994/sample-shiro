package top.yuyufeng.learn.shiro.dao;

import com.alibaba.fastjson.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.yuyufeng.learn.shiro.orm.po.PermissionInfo;
import top.yuyufeng.learn.shiro.orm.vo.TreeVO;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yuyufeng
 * @date 2018/2/9
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class PermissionDaoTest {
    @Autowired
    private PermissionInfoMapper permissionInfoMapper;

    @Test
    public void test() {
        List<PermissionInfo> permissionInfos = permissionInfoMapper.selectAll();
        List<TreeVO> treeList = new ArrayList<>();
        for (int i = 0; i < permissionInfos.size(); i++) {
            PermissionInfo permissionInfo = permissionInfos.get(i);
            if (permissionInfo.getParentId() == null) {
                TreeVO treeVO = new TreeVO();
                treeVO.setDataId(permissionInfo.getPermissionId());
                treeVO.setText(permissionInfo.getPermissionNotes());
                findChilds(treeVO, permissionInfos);
                treeList.add(treeVO);
            }
        }
        System.out.println(JSONObject.toJSON(treeList));

    }

    private void findChilds(TreeVO treeVO, List<PermissionInfo> permissionInfos) {
        List<TreeVO> treeChilds = new ArrayList<>();
        for (int i = 0; i < permissionInfos.size(); i++) {
            PermissionInfo permissionInfo = permissionInfos.get(i);
            if (permissionInfo.getParentId() == treeVO.getDataId()) {
                TreeVO treeChild = new TreeVO();
                treeChild.setDataId(permissionInfo.getPermissionId());
                treeChild.setText(permissionInfo.getPermissionNotes());
                findChilds(treeChild, permissionInfos);
                treeChilds.add(treeChild);
            }
        }
        treeVO.setNodes(treeChilds);
    }


    @Test
    public void testPage() {


    }

    @Test
    public void testInsert() {

    }

    @Test
    public void testList() {


    }

    @Test
    public void testGetNodeChilds() {
        List<PermissionInfo> permissionInfos = permissionInfoMapper.selectAll();
        Long id = 5L;
        List<PermissionInfo> results = new ArrayList<>();
        findNodeChilds(id, results, permissionInfos);
        for (PermissionInfo result : results) {
            System.out.println(result);
        }
    }

    private void findNodeChilds(Long id, List<PermissionInfo> results, List<PermissionInfo> permissionInfos) {
        for (PermissionInfo permissionInfo : permissionInfos) {
            if (permissionInfo.getParentId() == id) {
                results.add(permissionInfo);
                findNodeChilds(permissionInfo.getPermissionId(), results, permissionInfos);
            }
        }
    }


}
