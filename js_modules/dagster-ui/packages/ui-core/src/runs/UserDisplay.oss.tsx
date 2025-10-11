import {BaseTag, Box, MiddleTruncate, SubwayDot} from '@dagster-io/ui-components';

type Props = {
  email: string;
  isFilter?: boolean;
  size?: 'very-small' | 'small' | 'normal';
};
/**
 * Primarily used to display users in filter dropdown + users in table cells
 */
export function UserDisplay({email, isFilter}: Props) {
  const icon = <SubwayDot label={email} blobSize={16} fontSize={10} />;
  return isFilter ? (
    <Box flex={{direction: 'row', gap: 4, alignItems: 'center'}}>
      <span>{icon}</span>
      {email}
    </Box>
  ) : (
    <Box flex={{direction: 'row'}} style={{minWidth: 0, maxWidth: '100%'}}>
      <BaseTag
        key="user"
        icon={<div style={{margin: '0 4px 0 -4px'}}>{icon}</div>}
        label={<MiddleTruncate text={email} />}
      />
    </Box>
  );
}
