import { createSearch } from 'common/string';
import { useBackend, useLocalState } from '../backend';
import { Box, Icon, Input, Section, Button } from '../components';
import { NtosWindow } from '../layouts';

export const CivilianData = (props, context) => {
  const { act, data } = useBackend(context);
  const [searchTerm, setSearchTerm] = useLocalState(context, 'search', '');
  const { mode, records } = data;

  const isMatchingSearchTerms = createSearch(searchTerm);

  return (
    <NtosWindow width={600} height={800}>
      <br />
      <br />
      <br />
      <NtosWindow.Content scrollable />
      <Section>
        <Input
          placeholder={'Filter results...'}
          value={searchTerm}
          fluid
          textAlign="center"
          onInput={(e, value) => setSearchTerm(value)}
        />
      </Section>
      {records.map((record) => (
        <Section
          key={record.id}
          hidden={
            !(
              searchTerm === '' ||
              isMatchingSearchTerms(
                record.name +
                  ' ' +
                  record.rank +
                  ' ' +
                  record.species +
                  ' ' +
                  record.gender +
                  ' ' +
                  record.age +
                  ' ' +
                  record.fingerprint,
                ' ' + record.rationunit
              )
            )
          }>
          <Box bold>
            <Icon name="user" mr={1} />
            {record.name}
          </Box>
          <br />
          Rank: {record.rank}
          <br />
          Species: {record.species}
          <br />
          Gender: {record.gender}
          <br />
          Age: {record.age}
          <br />
          Fingerprint Hash: {record.fingerprint}
          <br />
          Ration Units: {record.rationunit}
          <br />
          <br />
          Criminal Status: {record.wanted || 'DELETED'}
          <Button
            content="Anti-Citizen"
            tooltip="Sets Citizen to a anti-citizen"
            onClick={() => act('anti-citizen')}
          />
          <Button
            content="Amputate"
            tooltip="Sets Citizen to be amputated"
            onClick={() => act('amputate')}
          />
          <Button
            content="Collaborator"
            tooltip="Sets Citizen to be a collaborator"
            onClick={() => act('collaborator')}
          />
          <Button
            content="Incarcerate"
            tooltip="Sets the citizen to incarcerated"
            onClick={() => act('incarcerate')}
          />
          <Button
            content="Reset"
            tooltip="Resets citizens status"
            onClick={() => act('reset')}
            color="#FF0000"
          />
        </Section>
      ))}
    </NtosWindow>
  );
};
