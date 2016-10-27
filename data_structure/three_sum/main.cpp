#include <unordered_map>
#include <iostream>
#include <vector>


using namespace std;
class Solution {
public:
    vector<vector<int> > threeSum(vector<int>& nums) {
        vector<vector<int> > result;
        vector<int> item;

        for (int i = 0; i < nums.size(); i++) {
            for (int j = i+1; j < nums.size(); j++) {
                unordered_map<int, int> hash;
                int t = (-nums[i]) - nums[j];
                if (hash.find(t) != hash.end()) { //find it
                    item.push_back(nums[i]);
                    item.push_back(t);
                    item.push_back(nums[j]);

                    result.push_back(item);
                    cout << "find one item" << endl;
                    item.clear();
                } else {
                //not find it
                    hash[nums[j]] = j;
                }
            }
        }
        return result;
    }
};

int main(void) {
    vector<int> v;
    v.push_back(-1);
    v.push_back(0);
    v.push_back(1);
    v.push_back(2);
    v.push_back(-1);
    v.push_back(-4);

    Solution s;
    s.threeSum(v);

}
