import com.lin.ssm.system.model.User;
import com.lin.ssm.system.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= "classpath:config/spring-config.xml")
public class TestClass {
    @Autowired
    private UserService userService;
    @Test
    public void test() {
        List<User> userList = userService.getAll();
        userList.forEach(System.out::println);
    }
}
