# QA Test Case: Remove American Cuisine from Home Screen Filter

## PR Details
- **PR Link**: https://github.com/anilYD1402/tab_hackthon_2025/pull/new/pr-31
- **Title**: Remove American cuisine from home screen filter list
- **File Modified**: `lib/screens/home_screen.dart`
- **Changes**: Removed 'American' from the cuisines list in HomeScreen widget

---

## Test Case Summary

| Test Case ID | TC_HS_001 |
|--------------|-----------|
| **Test Case Name** | Verify American cuisine is removed from filter options |
| **Test Objective** | Ensure that 'American' cuisine is no longer available in the cuisine filter chips on the home screen |
| **Priority** | High |
| **Severity** | Medium |
| **Test Type** | Functional UI Test |
| **Automation Status** | Manual |

---

## Test Case Details

| **Prerequisites** | **Test Case Steps** | **Test Data** | **Expected Output** | **Actual Output** | **Impacted Area** |
|-------------------|---------------------|---------------|---------------------|-------------------|-------------------|
| 1. Flutter app is installed and running<br>2. User is logged in and on home screen<br>3. Home screen displays cuisine filter chips | 1. Launch the FoodDelivery app<br>2. Navigate to home screen<br>3. Scroll to the "Filter by Cuisine" section<br>4. Observe the list of cuisine filter chips<br>5. Check that 'American' and 'Indian' options are absent | N/A (UI observation test) | The cuisine filter chips should display: All, Italian, Japanese, Mexican, Chinese<br>'American' and 'Indian' should NOT be present in the list | [To be filled during testing] | Home Screen UI<br>Cuisine Filtering Feature<br>User Experience |

---

## Additional Notes
- This change affects the UI display only; no backend or data changes
- Ensure that filtering still works correctly for remaining cuisines
- Test on different screen sizes to ensure proper display
- Verify that selecting other cuisines still filters restaurants appropriately